#include "Ranking.h"

int InitRanks(std::vector<Player> &ranks)
{
    Player pl;
    for (int i = 0; i < 10; i++)
    {
        pl.name = ".";
        pl.score = 0;
        ranks.push_back(pl);
    }
}

void ImportRanks(std::vector<Player> &ranks)
{
    std::ifstream ifs("PM_LDB.bin", std::ios::binary);
    char temp[40];
    for (int i = 0; i < 10; i++)
    {
        ifs.read(temp, 40);
        ranks[i].name = temp;
        
        ifs.read(temp, 4);
        ranks[i].score = (int) temp;
    }
}

void ExportRanks(std::vector<Player> ranks)
{
    std::ofstream ofs("PM_LDB.bin", std::ios::binary);
    char temp[40];
    for (int i = 0; i < 10; i++)
    {
        ranks[i].name.copy(temp, 40);
        ofs.write(temp, 40);
        ofs.write((char*) &(ranks[i].score), 4);
    }
}

