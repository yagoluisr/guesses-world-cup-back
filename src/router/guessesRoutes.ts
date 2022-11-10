import express from 'express';
import { getGuesses } from '../controllers/guessesController.js';

const router = express();

router.get('/guesses', getGuesses);

export default router;