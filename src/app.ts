import express from 'express';
import GameRoute from './routes/game-route.js'
import GuessRoute from './routes/guess-route.js'
import RankingRoute from './routes/ranking-route.js'
import { PORT } from "./configs/constants.js";



const server = express ();

server.use(express.json())
server.use(GameRoute);
server.use(GuessRoute);
server.use(RankingRoute);

server.listen(PORT,()=>{
    console.log("bora")
})