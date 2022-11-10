import express from 'express';
import { deleteGuess, getGuesses, insertGuess, updateGuess } from '../controllers/guessesController.js';

const router = express();

router.get('/guesses', getGuesses);
router.post('/guesses', insertGuess);
router.put('/guesses', updateGuess);
router.delete('/guesses', deleteGuess)


export default router;