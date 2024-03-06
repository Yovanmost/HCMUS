// import java.security.ProviderException;

import edu.princeton.cs.algs4.StdRandom;
import edu.princeton.cs.algs4.StdStats;

public class PercolationStats {
    final private int size;
    final private int trials;
    // number of successful trials
    final private double[] thresholds;

    // perform independent trials on an n-by-n grid
    public PercolationStats(int n, int t){
        if (n < 1 || t < 1)
            throw new IllegalArgumentException();
        
        size = n;
        trials = t;
        thresholds = new double[trials];
        
        // run trials
        for (int i = 0; i < trials; i++){
            // create a new model
            Percolation p = new Percolation(size);
            int countOpened = 0;
            
            // count the node needed to percolate
            while (!p.percolates()){
                openRandom(p);
                countOpened++;
            }
            thresholds[i] = (double) countOpened / (size * size);
        }
    }


    // sample mean of percolation threshold
    public double mean(){
        return StdStats.mean(thresholds);
    }

    // sample standard deviation of percolation threshold
    public double stddev(){
        return StdStats.stddev(thresholds);
    }

    // low endpoint of 95% confidence interval
    public double confidenceLo(){
        return mean() - ((1.96 * stddev()) / Math.sqrt(trials));
    }

    // high endpoint of 95% confidence interval
    public double confidenceHi(){
        return mean() + ((1.96 * stddev()) / Math.sqrt(trials));
    }

    // open a random node to testing inside the trials
    private void openRandom(Percolation p){
        boolean opened = true;
        int row = 0, col = 0;
        
        // pick a random node and check if it is opened
        while (opened){
            row = StdRandom.uniformInt(1, 1+size);
            col = StdRandom.uniformInt(1, 1+size);
            opened = p.isOpen(row, col);
        }
        // if it isn't then open
        p.open(row, col);
    }

    // test client (see below)
    // public static void main(String[] args){

    // }
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        int T = Integer.parseInt(args[1]);

        PercolationStats s = new PercolationStats(N, T);

        // System.out.println("mean:\t\t\t\t = " + s.mean());
        // System.out.println("stddev:\t\t\t\t = " + s.stddev());
        // System.out.println("95% confidence interval:\t = " + s.confidenceLo() + ", " + s.confidenceHi());
        System.out.println("mean: = " + s.mean());
        System.out.println("stddev = " + s.stddev());
        System.out.println("95% confidence interval = [" + s.confidenceLo() + ", " + s.confidenceHi() + "]");
    }
        
}
