enum MachineState 
{
  idle,
  running,
  stopped
}

class Machine 
{
  final String id;
  MachineState _state = MachineState.idle;

  Machine(this.id);

  MachineState get state => _state;

  void start() 
  {
    if (_state == MachineState.idle) 
    {
      _state = MachineState.running;
    }
  }

  void stop() 
  {
    if (_state == MachineState.running) 
    {
      _state = MachineState.stopped;
    }
  }

  void reset() 
  {
    if (_state == MachineState.stopped) 
    {
      _state = MachineState.idle;
    }
  }
}

class ProductionLine 
{
  final List<Machine> _machines = [];

  void addMachine(Machine machine) 
  {
    _machines.add(machine);
  }

  void startLine() 
  {
    for (var m in _machines) 
    {
      m.start();
    }
  }

  void stopLine() 
  {
    for (var m in _machines) 
    {
      m.stop();
    }
  }

  void printStatus() 
  {
    for (var m in _machines) 
    {
      print("Machine ${m.id}: ${m.state.name}");
    }
  }
}

void main() 
{
  Machine m1 = Machine("M1");
  Machine m2 = Machine("M2");

  ProductionLine line = ProductionLine();
  line.addMachine(m1);
  line.addMachine(m2);

  line.startLine();
  line.printStatus();

  line.stopLine();
  line.printStatus();

  m1.reset();
  m2.reset();
  line.printStatus();
}