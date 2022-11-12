import express from 'express';
import { endGame, updateGuessesStatus } from '../controllers/matchsController.js';

const router = express.Router();

router.put('/match', updateGuessesStatus);
router.put('/finished/match', endGame);

export default router;