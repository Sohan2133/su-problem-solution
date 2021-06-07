class Solution(object):
    def freqAlphabets(self, s):
        """
        :type s: str
        :rtype: str
        """
        hash_dict = {
            "10#" : "j",
            "11#": "k",
            "12#": "l",
            "13#": "m",
            "14#": "n",
            "15#": "o",
            "16#": "p",
            "17#": "q",
            "18#": "r",
            "19#": "s",
            "20#": "t",
            "21#": "u",
            "22#": "v",
            "23#": "w",
            "24#": "x",
            "25#": "y",
            "26#": "z"
        }

        hash_dict2 = {
            "1" : "a",
            "2": 'b',
            "3": 'c',
            "4": 'd',
            "5": 'e',
            "6": 'f',
            "7": 'g',
            "8": 'h',
            "9": 'i'
        }
        sl = len(s)
        result = ""
        i = 0
        while i < sl:
            v = hash_dict.get(s[i:i + 3])
            if v is not None:
                result += v
                i += 2
            else :
                v = hash_dict2.get(s[i:i+1])
                i += 1
                if v is not None:
                    result += v
        return result

if __name__ == '__main__':
    print(Solution().freqAlphabets("10#11#12"))
