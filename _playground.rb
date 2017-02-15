def translate (input)
    consonants = ('a'..'z').to_a
    vowels = [a,e,i,o,u]
    vowel = []
    vowel = vowel.push consonants.delete_at(0)
    vowel = vowel.push consonants.delete_at(3)
    vowel = vowel.push consonants.delete_at(6)
    vowel = vowel.push consonants.delete_at(11)
    vowel = vowel.push consonants.delete_at(16)
#=====================================================================    
    output = []
    sentence = input.split
#=====================================================================    
#two and one are arrays so they can't be inside the .include? parameter
#whichever word is first in the parameter gets added to output twice.
#if there's 3 words, it doubles to 6 words
    sentence.each do |x|
        one = x.slice(0)
        two = x.slice(1)
        if consonants.include?(two) && consonants.include?(one)
            first_two_letter = x[0..1]
            other_letters2 = x[2..-1]
            final_product2 = other_letters2 << first_two_letter << "ay"
            output << final_product2
        elsif consonants.include?(one)
            first_letter = x[0]
            other_letters = x[1..-1]
            final_product = other_letters << first_letter << "ay"
            output << final_product
        else
            final_product3 = x + "ay"
            output << final_product3
        end
    end
    output
end

p translate ("blue eeerry is so merry")