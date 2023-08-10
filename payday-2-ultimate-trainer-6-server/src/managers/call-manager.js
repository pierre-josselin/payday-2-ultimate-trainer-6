module.exports = class CallManager {
    calls = [];

    addCall(call) {
        this.calls.push(call);
    }

    getCalls() {
        return this.calls.splice(0, this.calls.length);
    }
}
