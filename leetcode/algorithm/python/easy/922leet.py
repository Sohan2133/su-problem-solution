class Solution(object):
    def sortArrayByParityII(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        A.sort()
        next_even_index = 0
        next_odd_index = 1
        result = []
        for element in A:
            if element%2 == 0:
                result.insert(next_even_index, element)
                next_even_index += 2
            else:
                result.insert(next_odd_index, element)
                next_odd_index += 2
        return result


if __name__ == '__main__':
    A = [4,2,5,7]
    print(Solution().sortArrayByParityII(A))
