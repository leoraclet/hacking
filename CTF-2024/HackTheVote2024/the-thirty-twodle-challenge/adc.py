from itertools import combinations

with open("solutions.txt", "r") as f:
    solutions = f.read().split("\n")

with open("ranked_words.txt", "r") as f:
    ranked_words = [k for k, _ in [line.split() for line in f.readlines()]]

def find_valid_word_combinations(word_list, valid_words):
    valid_set = set(valid_words)  # Use a set for fast lookup
    letter_positions = {i: set() for i in range(5)}  # Assuming words are 4 letters long

    # Precompute letters for each position
    for word in word_list:
        for i in range(len(word)):
            letter_positions[i].add(word[i])

    # Create combinations of 5 words
    for words in combinations(word_list, 5):
        # Collect letters for each position from the chosen words
        first_letters = {word[0] for word in words}
        second_letters = {word[1] for word in words}
        third_letters = {word[2] for word in words}
        fourth_letters = {word[3] for word in words}

        # Combine letters based on available positions
        possible_combinations = {}

        # Build combinations using available letters in letter_positions
        for first in letter_positions[0].intersection(first_letters):
            for second in letter_positions[1].intersection(second_letters):
                for third in letter_positions[2].intersection(third_letters):
                    for fourth in letter_positions[3].intersection(fourth_letters):
                        for fifth in letter_positions[3].intersection(fourth_letters):
                            combined_word = first + second + third + fourth + fifth
                            if combined_word in valid_set:
                                if words not in possible_combinations:
                                    possible_combinations[words] = 1
                                possible_combinations[words] += 1

                                print(
                                    f"Valid combination found: {combined_word} from {words}"
                                )

                                if possible_combinations[words] == len(valid_words):
                                    break

# Example usage
word_list = ranked_words  # Your list of possible words
valid_words = solutions  # Your list of valid words
find_valid_word_combinations(word_list, valid_words)
