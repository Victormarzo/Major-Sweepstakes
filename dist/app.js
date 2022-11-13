import express from express;
import GameRoute from './routes/GamesRoute.ts';
var server = express();
server.use(GameRoute);
server.listen(4000, function () {
    console.log("bora");
});
