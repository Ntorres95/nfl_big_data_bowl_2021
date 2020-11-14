-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/YkrCMX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "games" (
    "gameId" Integer   NOT NULL,
    "gameDate" Date   NOT NULL,
    "gameTimeEastern" Time   NOT NULL,
    "homeTeamAbbr" Varchar   NOT NULL,
    "visitorTeamAbbr" varchar   NOT NULL,
    "week" Integer   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "gameId"
     )
);

CREATE TABLE "players" (
    "nflId" Integer   NOT NULL,
    "height" Integer   NOT NULL,
    "weight" Integer   NOT NULL,
    "birthDate" Date   NOT NULL,
    "collegeName" Varchar   NOT NULL,
    "position" Varchar   NOT NULL,
    "displayName" Varchar   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "nflId"
     )
);

CREATE TABLE "weeksNFL" (
    "time" Time   NOT NULL,
    "x" Float   NOT NULL,
    "y" Float   NOT NULL,
    "s" Float   NOT NULL,
    "a" Float   NOT NULL,
    "dis" Float   NOT NULL,
    "o" Float   NOT NULL,
    "dir" Float   NOT NULL,
    "event" Varchar   NOT NULL,
    "nflId" Integer   NOT NULL,
    "displayName" Varchar   NOT NULL,
    "jerseyNumber" Integer   NOT NULL,
    "position" Varchar   NOT NULL,
    "frameID" Integer   NOT NULL,
    "team" Varchar   NOT NULL,
    "gameId" Integer   NOT NULL,
    "playId" Integer   NOT NULL,
    "playDirection" Varchar   NOT NULL,
    "route" Varchar   NOT NULL,
    CONSTRAINT "pk_weeksNFL" PRIMARY KEY (
        "nflId","frameID"
     )
);

CREATE TABLE "plays" (
    "gameID" Integer   NOT NULL,
    "playID" Integer   NOT NULL,
    "playDescription" Varchar   NOT NULL,
    "quarter" Integer   NOT NULL,
    "down" Integer   NOT NULL,
    "yardsToGo" Integer   NOT NULL,
    "possessionTeam" Varchar   NOT NULL,
    "playType" Varchar   NOT NULL,
    "yardlineSide" Varchar   NOT NULL,
    "yardlineNumber" Integer   NOT NULL,
    "offenseFormation" Varchar   NOT NULL,
    "personnelO" Varchar   NOT NULL,
    "defendersInTheBox" Integer   NOT NULL,
    "numberOfPassRushers" Integer   NOT NULL,
    "personnelD" Varchar   NOT NULL,
    "typeDropback" Varchar   NOT NULL,
    "preSnapVisitorScore" Integer   NOT NULL,
    "preSnapHomeScore" Integer   NOT NULL,
    "gameClock" Time   NOT NULL,
    "absoluteYardlineNumber" Integer   NOT NULL,
    "penaltyCodes" Varchar   NOT NULL,
    "penaltyJerseyNumbers" Varchar   NOT NULL,
    "passResult" Varchar   NOT NULL,
    "offensePlayResult" Integer   NOT NULL,
    "playResult" Integer   NOT NULL,
    "epa" Float   NOT NULL,
    "isDefensivePI" Boolean   NOT NULL,
    CONSTRAINT "pk_plays" PRIMARY KEY (
        "gameID"
     )
);

ALTER TABLE "games" ADD CONSTRAINT "fk_games_gameId" FOREIGN KEY("gameId")
REFERENCES "plays" ("gameID");

ALTER TABLE "weeksNFL" ADD CONSTRAINT "fk_weeksNFL_nflId" FOREIGN KEY("nflId")
REFERENCES "players" ("nflId");

ALTER TABLE "weeksNFL" ADD CONSTRAINT "fk_weeksNFL_gameId" FOREIGN KEY("gameId")
REFERENCES "games" ("gameId");

