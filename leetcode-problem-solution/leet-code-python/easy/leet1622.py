import math
class Solution(object):
    def minTimeToVisitAllPoints(self, points):
        """
        :type points: List[List[int]]
        :rtype: int
        """
        min_dis = 0
        for i in range(0,len(points) - 1):
            min_dis += max(abs(points[i][0] - points[i+1][0]) , abs(points[i][1] - points[i+1][1]))
        return min_dis


if __name__ == '__main__':
    points = [[1,1],[3,4],[-1,0]]
    Solution().minTimeToVisitAllPoints(points)
