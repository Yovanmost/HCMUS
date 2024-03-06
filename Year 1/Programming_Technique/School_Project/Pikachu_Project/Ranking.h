#include "AllLibraries.h"

struct Player
{
    std::string name;
    int score;
};

// LDB: leaderboard
static std::vector<Player> premove_ldb;
static std::vector<Player> premove_list;
static std::vector<Player> easy_ldb;
static std::vector<Player> easy_list;
static std::vector<Player> medium_ldb;
static std::vector<Player> medium_list;

