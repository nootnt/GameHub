import pygame
import sys

# Initialize Pygame
pygame.init()

# Constants
WIDTH, HEIGHT = 1280 , 720
FPS = 60

# Initialize screen
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("GameHub(tm) Rock Paper Scissors")

pygame.display.set_icon(pygame.image.load("res/GH.png"))

# Load the images
image = pygame.image.load("res/banners/rps.png")
image = pygame.transform.scale(image, (WIDTH, 360)) 

rock_img = pygame.image.load("res/rps/rock_orange.png")
rock_img = pygame.transform.scale(rock_img, (250, 250))

font = pygame.font.SysFont("calibri monospace", 36)

# Game loop
def main():
    running = True
    player1_choice = None
    player2_choice = None

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False

                # Player 1 controls
                if event.key in [pygame.K_a, pygame.K_d, pygame.K_s]:
                    player1_choice = get_choice_from_key(event.key)

                # Player 2 controls
                if event.key in [pygame.K_j, pygame.K_k, pygame.K_l]:
                    player2_choice = get_choice_from_key(event.key)

        if player1_choice is not None and player2_choice is not None:
            result = determine_winner(player1_choice, player2_choice)
            display_result(player1_choice, player2_choice, result)
            player1_choice = None
            player2_choice = None


        screen.fill("#0D0D0D")
        screen.blit(image,(-15,60))
        
        Player1_text=font.render("Player 1 choose: A(rock) S(paper) D(scissors)",True,"#F66600")
        screen.blit(Player1_text,(50,490))
        
        Player2_text=font.render("Player 2 choose: J(rock) K(paper) L(scissors)",True,"#00A1EA")
        screen.blit(Player2_text,(50,580))

        pygame.display.flip()
        pygame.time.Clock().tick(FPS)

    pygame.quit()

# Function to get the choice from the key pressed
def get_choice_from_key(key):
    if key == pygame.K_a:
        return rock_img
    elif key == pygame.K_s:
        return "paper"
    elif key == pygame.K_d:
        return "scissors"
    elif key == pygame.K_j:
        return "rock"
    elif key == pygame.K_k:
        return "paper"
    elif key == pygame.K_l:
        return "scissors"

# Function to determine the winner
def determine_winner(player1_choice, player2_choice):
    if player1_choice == player2_choice:
        return "It's a tie!"
    elif (
        (player1_choice == rock_img and player2_choice == "scissors")
        or (player1_choice == "paper" and player2_choice == rock_img)
        or (player1_choice == "scissors" and player2_choice == "paper")
    ):
        return "Player 1 wins!"
    else:
        return "Player 2 wins!"

# Function to display the result
def display_result(player1_choice, player2_choice, result):
    screen.fill(GREY)

    player1_text = font.render(f"Player 1: {player1_choice}", True, ORANGE)
    player2_text = font.render(f"Player 2: {player2_choice}", True, ORANGE)
    result_text = font.render(result, True, ORANGE)

    
    screen.blit(player1_text, (50, 50))
    screen.blit(player2_text, (50, 100))
    screen.blit(result_text, (50, 150))

    pygame.display.flip()
    pygame.time.delay(4000)

# Run the game
if __name__ == "__main__":
    main()