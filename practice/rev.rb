def hereme(s, flip)
    str = ""
    count = 0 
    s.split("").each_with_index do |c, index|
        if count > 0
            count -= 1
            next
        elsif c == "("
            n_b = flip ? false : true
            
            result = hereme(s[index+1..s.size-1], n_b)
            str += result[:str]
            count = result[:c]
        elsif c == ")"
            return {str: str, c: index + 1} 
        elsif flip 
            str = c + str
        else
            str += c
        end
    end
    str
end

def reverseParentheses(s)
    p hereme(s, false)
end
