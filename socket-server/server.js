const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const fetch = require('node-fetch');

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
    cors: {
        origin: '*',
        methods: ['GET', 'POST'],
    },
});

io.on('connection', (socket) => {
    console.log('a user connected');

    socket.on('disconnect', () => {
        console.log('user disconnected');
    });

    socket.on('joinRoom', async ({ roomId, password }) => {
        if (!roomId) {
            console.error('Room ID is undefined');
            socket.emit('error', { message: 'Room ID is undefined' });
            return;
        }
        try {
            const response = await fetch(`http://php:80/messages.php?room_id=${roomId}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            const room = data.rooms.find(room => room.id == roomId);
          
            socket.join(roomId);
            console.log(`User joined room: ${roomId}`);
            socket.emit('joinedRoom', roomId);
        } catch (error) {
            console.error('Fetch error:', error);
            socket.emit('error', { message: 'Failed to join the room' });
        }
    });

    socket.on('sendInvitation', async ({ roomId, roomName, invitedBy, invitedUser, password }) => {
        try {
            const response = await fetch('http://php:80/sendInvitation.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ roomId, roomName, invitedBy, invitedUser, password }),
            });
    
            const data = await response.json();
            if (data.status === 'success') {
                socket.emit('invitationStatus', { status: 'success', message: `Invitation sent to ${invitedUser} for room ${roomName}` });
            } else {
                socket.emit('invitationStatus', { status: 'error', message: data.message });
            }
        } catch (error) {
            socket.emit('invitationStatus', { status: 'error', message: 'Error sending invitation' });
        }
    });


    socket.on('changePassword', async ({ roomId, newPassword }) => {
        if (!roomId || !newPassword) {
            socket.emit('passwordChanged', { status: 'error', message: 'Missing room ID or new password' });
            return;
        }

        try {
            const response = await fetch('http://php:80/updatePassword.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ roomId, newPassword }),
            });

            const data = await response.json();

            if (data.status === 'success') {
                socket.emit('passwordChanged', { status: 'success' });
            } else {
                socket.emit('passwordChanged', { status: 'error', message: 'Failed to change the password' });
            }
        } catch (error) {
            console.error('Error changing password:', error);
            socket.emit('passwordChanged', { status: 'error', message: 'Server error' });
        }
    });


    socket.on('createRoom', async ({ roomName, isPrivate, password, pin, createdBy }) => {
        console.log(`Creating room: ${roomName}`);
        try {
            const response = await fetch('http://php:80/createRoom.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ createRoom: true, roomName, isPrivate, password, pin, createdBy }),
            });
            const result = await response.json();
            console.log('Room creation response:', result);
            if (result.status === 'success') {
                io.emit('roomCreated', result.room);
            } else {
                console.error(result.message);
            }
        } catch (error) {
            console.error('Fetch error:', error);
        }
    });

    socket.on('message', (msg) => {
        console.log(`Received message: ${JSON.stringify(msg)}`);
        io.to(msg.room_id).emit('message', msg);
    });
    
});

server.listen(4000, () => {
    console.log('Socket.IO server running on port 4000');
});
