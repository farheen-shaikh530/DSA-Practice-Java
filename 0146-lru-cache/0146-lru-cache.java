class LRUCache {

private static class Node{
int key, value;
Node prev, next;

Node(int k, int v){ 
        key = k; value = v;
    }
}


private final int capacity;

private final Map<Integer, Node> map;

private final Node head;
private final Node tail;

    public LRUCache(int capacity) {
 
     this.capacity = capacity;
     this.map = new HashMap<>();
     head = new Node(0,0);
     tail = new Node(0,0);

     head.next = tail;
     tail.prev = head;

    }
    
    public int get(int key) {
        Node node = map.get(key);
        if(node == null) return -1;
        moveToFront(node);
        return node.value;
    }
    
    public void put(int key, int value) {

        Node node = map.get(key);
        if(node != null){
            node.value = value;
            moveToFront(node);
            return;

        }

         Node newNode = new Node(key, value);
        map.put(key, newNode);
        addToFront(newNode);

        if (map.size() > capacity) {
            Node lru = removeLRU();
            map.remove(lru.key);
        }   
    }

    private void addToFront(Node node){

Node first = head.next;

        node.prev = head;
        node.next = first;

        head.next = node;
        first.prev = node;


    }
    private void removeNode(Node node) {
    Node p = node.prev;
    Node n = node.next;

    p.next = n;
    n.prev = p;
}
    private void moveToFront(Node node){
       removeNode(node);
addToFront(node);

       
        

    }
    private Node removeLRU() {
    Node lru = tail.prev;   // last real node (least recently used)
    removeNode(lru);
    return lru;
}



}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */