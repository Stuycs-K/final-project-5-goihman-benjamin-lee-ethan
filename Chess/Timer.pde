public class Timer {
    private long len; // Length of the timer in milliseconds

    public Timer(long len) {
        this.len = len;
    }

    public long timeLeft() {
        return len;
    }

    public void addTime(long milliseconds) {
        this.len += milliseconds;
    }

    public void removeTime(long milliseconds) {
        this.len -= milliseconds;
        if (this.len < 0) {
            this.len = 0;
        }
    }
}
