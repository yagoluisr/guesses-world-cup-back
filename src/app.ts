import express from 'express';
import dotenv from 'dotenv';
import userRouter from './router/userRoutes.js';
import guessesRouter from './router/guessesRoutes.js';

dotenv.config();
const server = express();
server.use(express.json());

server.use(userRouter);
server.use(guessesRouter);

server.get('/status', (req, res) => {
    res.send('ok')
})

server.listen(process.env.PORT , () => {
    console.log(`listening on port + ${process.env.PORT}`)
});