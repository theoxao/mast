import RPi.GPIO as GP


class Input:

    def __init__(self, channel, initial):
        self.channel = channel
        self.initial = initial
        GP.setup(self.channel, GP.IN, initial=self.initial)

    def read(self):
        return GP.input(self.channel)

    """
       callback = def foo(channel): do something 
    """

    def on(self, state, callback):
        GP.add_event_callback(self.channel, state, callback=callback)


class Output:

    def __init__(self, channel, initial):
        self.channel = channel
        self.initial = initial
        GP.setup(self.channel, GP.OUT, initial=self.initial)

    def high(self):
        GP.output(self.channel, True)

    def low(self):
        GP.output(self.channel, False)

    def set(self, bit):
        GP.output(self.channel, bit)

    def clean(self):
        GP.cleanup(self.channel)


class I595:
    def __init__(self, shcp, stcp, ds):
        self.shcp = shcp  # 11
        self.stcp = stcp  # 12
        self.ds = ds  # 14

    def flush(self):
        self.stcp.high()
        self.stcp.low()

    def shift(self, bit):
        self.ds.set(bit)
        self.shcp.high()
        self.shcp.low()

    def fresh(self, bits):
        for bit in bits:
            self.shift(bit)
        self.flush()
