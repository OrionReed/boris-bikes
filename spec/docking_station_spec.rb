require "docking_station"
describe DockingStation do
  it { is_expected.to(respond_to(:release_bike)) }
  it { is_expected.to(respond_to(:dock)) }
  it { is_expected.to(respond_to(:capacity)) }
  it { is_expected.to(respond_to(:dock).with(1).argument) }
  describe '#release_bike' do
    it 'raises an error when empty' do
      expect { subject.release_bike }.to(raise_exception('No bikes to release'))
    end
    it "gives a bike that responds to #working?" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).not_to(be_broken)
    end
    it "doesn't release broken bikes" do
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect { subject.release_bike }.to(raise_exception('No working bikes'))
    end
  end
  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to(raise_exception('Dock is full'))
    end
  end
end
