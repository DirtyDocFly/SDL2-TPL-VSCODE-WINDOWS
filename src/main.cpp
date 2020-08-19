#include <stdio.h>
#include <SDL2/SDL.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("Start\n");
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0)
    {
        printf("Failed to initialise SDL\n");
        return -1;
    }

    SDL_Window *window = SDL_CreateWindow("Demo Game",
                                          SDL_WINDOWPOS_UNDEFINED,
                                          SDL_WINDOWPOS_UNDEFINED,
                                          640,
                                          480,
                                          SDL_WINDOW_SHOWN);

    if (window == NULL)
    {
        SDL_Log("Could not create a window: %s", SDL_GetError());
        return -1;
    }

    SDL_Renderer *renderer =
        SDL_CreateRenderer(window,
                           -1,
                           SDL_RENDERER_ACCELERATED |
                               SDL_RENDERER_PRESENTVSYNC);
    if (renderer == NULL)
    {
        SDL_Log("Could not create a renderer: %s", SDL_GetError());
        return -1;
    }

    while (true)
    {
        SDL_Event event;
        if (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT)
            {
                break;
            }
        }

        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
