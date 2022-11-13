import express from 'express';
import { deleteUserGuess, insertNewGuess } from '../controllers/guess-controller.js';
const router = express.Router();

router.post('/guess',insertNewGuess)
router.delete('/guess',deleteUserGuess)
export default router;