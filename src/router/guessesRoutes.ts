import express from 'express';
import { deleteGuess, getGuesses, getGuessesById, insertGuess, updateGuess } from '../controllers/guessesController.js';

const router = express();

router.get('/guesses', getGuesses);
router.get('/guesses/:id', getGuessesById);
router.post('/guesses', insertGuess);
router.put('/guesses', updateGuess);
router.delete('/guesses', deleteGuess)


export default router;