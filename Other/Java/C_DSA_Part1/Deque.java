import java.util.Iterator;
import java.util.NoSuchElementException;

import java.util.concurrent.TimeoutException;
import javax.management.loading.PrivateClassLoader;
import org.w3c.dom.Node;

public class Deque<Item> implements Iterable<Item> {
    private Node head = null; // top stack and front queue
    private Node tail = null; // rear of queue
    private int size = 0;

    private class Node{
        Item item;
        Node pNext;
        Node pPrev;
    }

    // Corner cases
    private void checkAdd(Item item){
        if (item == null)
            throw new IllegalArgumentException("NULL, really?");
    }

    private void checkRemove(){
        if (isEmpty())
            throw new NoSuchElementException("Nothing left");
    }

    // construct an empty deque
    public Deque(){
    }

    // is the deque empty?
    public boolean isEmpty(){
        if (size == 0)    
            return true;
        return false;
    }

    // 1 2 3 4 5 6 7 8 9
    // f               b

    // return the number of items on the deque
    public int size(){
        return size;
    }

    // add the item to the front
    public void addFirst(Item item){
        checkAdd(item);
        if (isEmpty()){
            head = new Node();
        }
        else {
            Node old = head;
            head = new Node();
            head.item = item;
            head.pNext = old;
        }
        
    }

    // add the item to the back
    public void addLast(Item item){
        checkAdd(item);

    }

    // remove and return the item from the front
    public Item removeFirst(){

    }

    // remove and return the item from the back
    public Item removeLast(){
        
    }

    // return an iterator over items in order from front to back
    public Iterator<Item> iterator(){

    }

    // unit testing (required)
    public static void main(String[] args){

    }

}