import edu.princeton.cs.algs4.WeightedQuickUnionUF;

public class Percolation {
    // NOTE: I don't fck know why array start with 1 instead of 0
    private WeightedQuickUnionUF grid;
    // without bottom node
    private WeightedQuickUnionUF full;
    private int size;
    private int topNode = 0;
    private int bottomNode;
    private boolean[] openedNode;


    // creates n-by-n grid, with all sites initially blocked
    public Percolation(int n){
        if (n < 1)
            throw new IllegalArgumentException();
        grid = new WeightedQuickUnionUF(n * n + 2);
        full = new WeightedQuickUnionUF(n * n + 1);
        
        size = n;
        // last element in full and second last in grid
        topNode = matrixToArrayIndex(size, size) + 1;
        bottomNode = matrixToArrayIndex(size, size) + 2;
        openedNode = new boolean[size * size];
    }

    private boolean checkCoordinate(int x, int y){
        if (x > 0 && y > 0 && x <= size && y <= size){
            return true;
        }
        return false;
    }

    private void checkOutOfBound(int x, int y){
        if (checkCoordinate(x, y))
            throw new IndexOutOfBoundsException(x); 
    }

    private int matrixToArrayIndex(int x, int y){
        // if the coordinate is valid
        checkOutOfBound(x, y);
        int idex = size * (x - 1) + y - 1;
        return idex;

    }

    // opens the site (row, col) if it is not open already
    public void open(int row, int col){
        checkOutOfBound(row, col);

        // already opened then do nothing
        if (isOpen(row, col))
            return;
        
        int idex = matrixToArrayIndex(row, col);
        openedNode[idex] = true;

        // the top left corner
        if (row == 1){
            grid.union(topNode, idex);
            full.union(topNode, idex);
        }

        // the bottom right corner
        if (row == size){
            grid.union(bottomNode, idex);
        }

        // Top
        if (checkCoordinate(row, col+1) && isOpen(row, col+1)){
            grid.union(matrixToArrayIndex(row, col+1), idex);
            full.union(matrixToArrayIndex(row, col+1), idex);
        }

        // Bottom
        if (checkCoordinate(row, col-1) && isOpen(row, col-1)){
            grid.union(matrixToArrayIndex(row, col-1), idex);
            full.union(matrixToArrayIndex(row, col-1), idex);
        }

        // Left
        if (checkCoordinate(row-1, col) && isOpen(row-1, col)){
            grid.union(matrixToArrayIndex(row-1, col), idex);
            full.union(matrixToArrayIndex(row-1, col), idex);
        }

        // Right
        if (checkCoordinate(row+1, col) && isOpen(row+1, col)){
            grid.union(matrixToArrayIndex(row+1, col), idex);
            full.union(matrixToArrayIndex(row+1, col), idex);
        }
    }

    // is the site (row, col) open?
    // return the node state (true is for opened, false is for closed)
    public boolean isOpen(int row, int col){
        checkOutOfBound(row, col);
        return openedNode[matrixToArrayIndex(row, col)];
    }

    // is the site (row, col) full?
    public boolean isFull(int row, int col){
        if (full.find(topNode) == full.find(matrixToArrayIndex(row, col)))
            return true;
        return false;
    }

    
    // returns the number of open sites
    public int numberOfOpenSites(){
        int count = 0;
        for (int i = 1; i <= size; i++)
            for (int j = 1; j <= size; j++)
                if (isOpen(i, j))
                    count++;
        return count;
    }

    // does the system percolate?
    public boolean percolates(){
        if (grid.find(topNode) == grid.find(bottomNode))
            return true;
        return false;
    }


    // test client (optional)
    public static void main(String[] args){
        
    }
        

}
