function replace_char(pos, str, r)
    return str:sub(1, pos - 1) .. r .. str:sub(pos + 1)
end

asciilist = {}
asciilist[1] = [[
   +----+
   |    |
        |
        |
        |
        |
 ==========
]]
asciilist[2] = [[
   +----+
   |    |
   0    |
        |
        |
        |
 ==========
]]
asciilist[3] = [[
   +----+
   |    |
   0    |
   |    |
        |
        |
 ==========
]]
asciilist[4] = [[
   +----+
   |    |
   0    |
  /|    |
        |
        |
 ==========
]]
asciilist[5] = [[
   +----+
   |    |
   0    |
  /|\   |
        |
        |
 ==========
]]
asciilist[6] = [[
   +----+
   |    |
   0    |
  /|\   |
  /     |
        |
 ==========
]]
asciilist[7] = [[
   +----+
   |    |
   0    |
  /|\   |
  / \   |
        |
 ==========
]]

-- Prepare list of words
words = { 'phone', 'computer', 'television', 'switch', 'printer', 'tablet' }
-- Pick random word
math.randomseed(os.time())
index = math.random(1, #words)
word = words [index]
wrong_guesses = 0
guess = ''

for i = 1, #word do
    guess = guess .. '_'
end

-- Start main loop
print "The theme is... !"
while wrong_guesses < 6 do

    -- Show Mister Hangperson
    print (asciilist[wrong_guesses + 1])
    -- Show current guess (initially _,_,_,_,_,_)
    print(' ' .. guess)
    -- Ask user for a letter (using io.read())
    print ''
    print('Choose a letter.')
    letter = io.read()
    -- Update the guess with the current letter (iterate over word using for, if letter in word, replace in guess)
    found_letter = false
    
    for i = 1, #word do
        curr_letter = word:sub(i, i)
        if letter == curr_letter then
            guess = replace_char(i, guess, letter)
            found_letter = true
        end
    end
    
    if found_letter == false then
        wrong_guesses = wrong_guesses + 1
    end
    
    -- If gussed all letters print 'You win!'
    if guess == word then
        print(word)
        print "You're a smart little cookie. Good job!"
        return
    end
end

print (asciilist[7])
print("Incorrect! The words is: " .. word .. ".")