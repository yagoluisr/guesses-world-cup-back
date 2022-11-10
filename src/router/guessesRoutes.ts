import express from 'express';
import { getGuesses, insertGuess, updateGuess } from '../controllers/guessesController.js';

const router = express();

router.get('/guesses', getGuesses);
router.post('/guesses', insertGuess);
router.put('/guesses', updateGuess);


export default router;