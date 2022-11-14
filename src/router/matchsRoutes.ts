import express from 'express';
import { allMatchs, endGame, updateGuessesStatus } from '../controllers/matchsController.js';

const router = express.Router();

router.get('/matchs', allMatchs);
router.put('/match', updateGuessesStatus);
router.put('/finished/match', endGame);

export default router;