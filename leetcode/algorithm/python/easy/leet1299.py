
class Solution(object):
    def replaceElements(self, arr):
        """
        :type arr: List[int]
        :rtype: List[int]
        """
        i = len(arr) - 1
        mx = - 1
        while i >= 0 :
            a = arr[i]
            arr[i] = mx
            mx = max(a,mx)
            i -= 1
        return arr


    def replaceElements1(self, arr):
        """
        :type arr: List[int]
        :rtype: List[int]
        """
        last = len(arr) - 1
        max_value =  0
        for i in range(0, last):
            if max_value == 0 or arr[i] <= max_value:
                max_value = self.get_max(arr, i + 1)
            arr[i] = max_value

        arr[last] = -1
        return arr

    def get_max(self, arr, from_index):
        max_value = 0
        for i in range(from_index, len(arr)):
            max_value = max(max_value , arr[i])
        return max_value

if __name__ == '__main__':
    arr = [17, 18, 5, 4, 6, 1]
    print(Solution().replaceElements(arr))