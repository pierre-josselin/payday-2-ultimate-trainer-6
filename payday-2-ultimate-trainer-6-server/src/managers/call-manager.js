class CallManager {
    calls = [];

    addCall(call) {
        this.calls.push(call);
    }

    getCalls() {
        const calls = this.calls;
        this.calls = [];
        return calls;
    }
}

module.exports = CallManager;
