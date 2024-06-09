public class Timer {
    private int len;
    private long timeLast;

    public Timer(int len) {
        this.len = len;
        this.timeLast = System.currentTimeMillis();
    }

    public int timeLeft() {
        long currentTime = System.currentTimeMillis();
        long elapsed = (currentTime - timeLast) / 1000;
        int remaining = len - (int) elapsed;
        return remaining > 0 ? remaining : 0;
    }

    public void addTime(int seconds) {
        this.len += seconds;
    }

    public void removeTime(int seconds) {
        this.len -= seconds;
        if (this.len < 0) {
            this.len = 0;
        }
    }
}
