# Found at http://icfun.blogspot.com/2008/04/ruby-determination-of-palindrome.html

word = "tacocat"
sentance = "A nut for a jar of tuna"

def palindrome?(word)
    ## Convert the given parameter into String first
    ## So that it can handle number too.
    word = String(word.split.join);
    x = 0;
    y = word.length - 1;
    while(x <= y)
        if(word[x] != word[y])
            return false;
        end
        x = x + 1;
        y = y - 1;
    end
    return true;
end

palindrome?(word)