import express from 'express';
import { getGameList } from '../controllers/GameController.js';
var router = express.Router();
router.post('/games', getGameList);
export default router;
