
class Solution(object):
    def findNumbers(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        even_count = 0
        for num in nums:
            dc = 0
            while num > 0:
                dc = dc + 1
                num = int(num / 10)
            if dc % 2 == 0:
                even_count = even_count + 1
        return even_count


if __name__ == '__main__':
    nums = [555, 901, 482, 1771]
    Solution().findNumbers(nums)
    nums = [12,345,2,6,7896]
    Solution().findNumbers(nums)
    pass
