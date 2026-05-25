class Solution {
    public int maximalRectangle(char[][] matrix) {
        
if(matrix == null || matrix.length == 0){
    return 0;
}
int rows = matrix.length;
int cols = matrix[0].length;
int[] heights = new int[cols];

int maxArea = 0;

for(int r = 0; r < rows; r++){
    for(int c = 0; c < cols; c++){
        if(matrix[r][c] == '1'){
            heights[c]++;

        }
        else{
        heights[c] = 0;
        }
    }
    maxArea = Math.max(maxArea, largestRectanglearea(heights));
}
        return maxArea;

    }

    private int largestRectanglearea(int[] heights){
        Stack<Integer> stack = new Stack<>();
        int maxArea = 0;

        for(int i = 0; i<= heights.length; i++){
            int currentHeight = (i == heights.length) ? 0 : heights[i];

            while(!stack.isEmpty() && currentHeight < heights[stack.peek()]){
                
                int height = heights[stack.pop()];
                int width;

                if(stack.isEmpty()){

                    width = i;

                }
                else{
                    width = i - stack.peek() - 1;

                }

                maxArea = Math.max(maxArea, height * width);


            }

            stack.push(i);

        }
        return maxArea;

    }

}

    
