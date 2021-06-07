class Solution(object):
    def oddCells(self, n, m, indices):
        """
        :type n: int // row
        :type m: int // col
        :type indices: List[List[int]]
        :rtype: int
        """
        odd = 0
        matrix = [[0 for j in range(0, m)] for i in range(0,n)]
        for indice in indices:
            row = indice[0]
            column = indice[1]
            for i in range(0,m):
                matrix[row][i] = matrix[row][i] + 1
                odd = self.get_balanced_odd(matrix[row][i], odd)
            for i in range(0,n):
                matrix[i][column] = matrix[i][column] + 1
                odd = self.get_balanced_odd(matrix[i][column], odd)
        return odd

    def get_balanced_odd(self, value, odd):
        if value % 2 == 1 :
            odd += 1
        else :
            odd -= 1
        return odd

if __name__ == '__main__':
    n = 2
    m = 3
    indices = [[1,1],[0,0]]
    print(Solution().oddCells(2,2,indices))