#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    int seed;
    char guess_count;
    char auto_solves[32];
    struct
    {
        char letters[5];
    } solutions[32];
    struct
    {
        char letters[5];
    } guesses[37];
} game_t;

char **valid_word_list;
char **word_list;

char nextchar()
{
    char cVar1;
    cVar1 = getchar();
    while (cVar1 == '\n')
    {
        cVar1 = getchar();
    }
    return cVar1;
}

unsigned int check_word(char *word1, char *word2);
unsigned int run_auto_solver(game_t *game);
void print_game(game_t *game);

int main(int argc, char **argv, char **envp)
{
    long lVar1;
    unsigned int word_res;
    char bVar2;
    int ret;
    long in_FS_OFFSET;
    char **envp_local;
    char **argv_local;
    int argc_local;
    unsigned int i;
    unsigned int j;
    unsigned int i_1;
    unsigned int j_1;
    unsigned int i_2;
    unsigned int j_2;
    unsigned int winner;
    unsigned int current;
    unsigned int found;
    unsigned int all_correct;
    unsigned int solution;
    unsigned int is_correct;
    unsigned int guess;
    unsigned int row;
    unsigned int col;
    unsigned int is_correct_1;
    unsigned int correct_guess;
    unsigned int guess_1;
    unsigned int auto_solve_count;
    unsigned int k;
    unsigned int solution_1;
    unsigned int word;
    unsigned int which_word;
    game_t game;
    bool is_solved;
    bool is_valid_word;
    bool word_is_solution;

    lVar1 = *(long *)(in_FS_OFFSET + 0x28);
    puts("The thirty-twodle challenge! Enter game seed:");
    scanf("%x", &game);
    if (game.seed == 0)
    {
        ret = 1;
    }
    else
    {
        srand(game.seed);
        game.guess_count = '\0';
        for (i = 0; i < 32; i = i + 1)
        {
            for (j = 0; j < 5; j = j + 1)
            {
                game.solutions[i].letters[j] = 0;
            }
            game.auto_solves[i] = '\0';
        }
        for (i_1 = 0; i_1 < 37; i_1 = i_1 + 1)
        {
            for (j_1 = 0; j_1 < 5; j_1 = j_1 + 1)
            {
                game.guesses[i_1].letters[j_1] = 0;
            }
        }
        for (i_2 = 0; i_2 < 32; i_2 = i_2 + 1)
        {
            ret = rand();
            for (j_2 = 0; j_2 < 5; j_2 = j_2 + 1)
            {
                game.solutions[i_2].letters[j_2] = word_list[(ret % 2313)][j_2];
            }
        }
        is_solved = false;
        for (current = 0; current < 37; current = current + 1)
        {
            word_res = run_auto_solver(&game);
            if (word_res == 0)
            {
                printf("Guess %d/%d: ", (current + 1), 37);
                ret = nextchar();
                game.guesses[current].letters[0] = (char)ret;
                ret = nextchar();
                game.guesses[current].letters[1] = (char)ret;
                ret = nextchar();
                game.guesses[current].letters[2] = (char)ret;
                ret = nextchar();
                game.guesses[current].letters[3] = (char)ret;
                ret = nextchar();
                game.guesses[current].letters[4] = (char)ret;
                is_valid_word = false;
                for (word = 0; word < 14855; word = word + 1)
                {
                    word_res = check_word(valid_word_list[word], game.guesses[current].letters);
                    if (word_res != '\0')
                    {
                        is_valid_word = true;
                        break;
                    }
                }
                if (!is_valid_word)
                {
                    puts("That\'s not a valid word! Check the valid word list :)");
                    break;
                }
                game.guess_count = current + 1;
            }
            print_game(&game);
            is_valid_word = true;
            for (solution = 0; solution < 32; solution = solution + 1)
            {
                word_is_solution = false;
                for (guess = 0; guess < game.guess_count; guess = guess + 1)
                {
                    word_res = check_word(game.guesses[guess].letters,
                                          game.solutions[solution].letters);
                    if (word_res != '\0')
                    {
                        word_is_solution = true;
                        break;
                    }
                }
                if (!word_is_solution)
                {
                    is_valid_word = false;
                    break;
                }
            }
            if (is_valid_word)
            {
                is_solved = true;
                break;
            }
        }

        // ================================================================= //
        // CHECK
        // ================================================================= //

        auto_solve_count = 0;
        for (k = 0; k < 32; k = k + 1)
        {
            if (game.auto_solves[k] != 0)
            {
                auto_solve_count = auto_solve_count + 1;
            }
        }
        if ((is_solved) && (31 < auto_solve_count))
        {
            puts("You solved the challenge!");
            system("/bin/sh");
            ret = 0;
        }
        else if (is_solved)
        {
            puts("You may have solved the puzzle but you did not solve the challenge ;)");
            ret = 1;
        }
        else
        {
            ret = 1;
        }
    }
    return ret;
}
