import express from 'express';
import { getGuesses, insertGuess } from '../controllers/guessesController.js';

const router = express();

router.get('/guesses', getGuesses);
router.post('/guesses', insertGuess);


export default router;