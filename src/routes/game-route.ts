import express from 'express';
import { getGameList,insertNewGame,updateGame } from '../controllers/game-controller.js';

const router = express.Router();

router.get('/games',getGameList)
router.post('/games',insertNewGame)
router.put('/games/:gameId',updateGame)

export default router;