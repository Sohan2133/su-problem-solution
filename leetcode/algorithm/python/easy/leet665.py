
class Solution(object):
    def checkPossibility(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        i = 1
        is_possible = True
        while i < len(nums) and nums[i - 1] <= nums[i]:
            i += 1

        if i >= len(nums) - 1:
            return is_possible

        prev = nums[i]
        nums[i] = min(nums[i - 1], nums[i+1])
        possible1 = self.get_is_possible(nums)

        if possible1 is True:
            return possible1

        nums[i] = prev

        if i == 1:
            nums[i - 1] = nums[i]
        else:
            nums[i - 1] = min(nums[i-2], nums[i])

        return self.get_is_possible(nums)

    def get_is_possible(self,nums):
        i = 1
        while i < len(nums) and nums[i - 1] <= nums[i]:
            i += 1
        return i == len(nums)

if __name__ == '__main__':
    A = [4,2,1]
    A1 = [3,4,2,3]
    # Acutal : True
    # Expected : False
    A3 = [2,3,3,2,4]

    print(Solution().checkPossibility(A))
    print(A)