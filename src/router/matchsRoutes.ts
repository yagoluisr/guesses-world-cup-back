import express from 'express';
import { updateGuessesStatus } from '../controllers/matchsController.js';

const router = express.Router();

router.put('/match', updateGuessesStatus);

export default router;