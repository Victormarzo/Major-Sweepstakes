# Major Sweepstakes

This is project created as a Proof of concept for typescript.
In this API you can post your and your friends guesses on who's winning the matches on CSGO:Rio Major Legends Stage as if the matches were BO1 format. 

## Installation

- Clone this repository 
- Install all dependencies:

```bash
npm i
```
- Create an `.env`  file as in `.env.example` file
- Create a local postgres database using the dump.sql file
- Start the application:
```bash
npm run dev
```
## API Documentation

Teams

| id   | Team       |
| --- | --- |
| 1   | FURIA       |
| 2   | NAVI       |
| 3   | FNATIC       |
| 4   | OUTSIDERS       |
| 5   | MOUZ      |
| 6   | C9      |
| 7   | SPIRIT   |
| 8   | HEROIC  |

Maps

| id   | Map       |
| --- | --- |
| 1   | MIRAGE       |
| 2   | DUST2       |
| 3   | VERTIGO       |
| 4   | NUKE       |
| 5   | OVERPASS      |
| 6   | INFERNO      |
| 7   | ANCIENT   |

----
### Games
#### Get
```http
  GET /games
```

 Returns a list of all matches
#### Post
```http
  POST /games
```
Inserts a new game, using the following JSON body format
```json
{
 "firstTeamId":1,
 "secondTeamId":2,
 "mapId":3
}
```
#### Put
```http
  PUT /games:gameId
```
Updates the status of a match establishing a winner by sending the match id through parameters and the winner team name through query 

Ex:
```http
/games/2?winner=NAVI
```

### Guess
#### Post
```http
  POST /guess
```
Inserts a new guess, he following JSON body format
```json
{
 "name": "Victor",
 "matchId":2,
 "guess" :"FURIA"
}
```

#### Delete
```http
  DELETE /guess
```
Delete a guess by sending the name and the gameId through query

Ex:
```http
/guess/?gameId=2&name=Claudio
```

### Ranking
#### Get
```http
  GET /ranking
```
Returns a list of right guesses per name
