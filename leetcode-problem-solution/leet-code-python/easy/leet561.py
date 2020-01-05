class Solution(object):
    def arrayPairSum(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        nums.sort()
        max_sum = 0
        i = 0
        while i < len(nums) - 1 :
            max_sum = max_sum + min(nums[i], nums[i+1])
            i += 2
        return max_sum


if __name__ == '__main__':
    nums = [1,4,3,2]
    print(Solution().arrayPairSum(nums))
