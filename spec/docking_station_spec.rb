require 'docking_station'

describe DockingStation do
	subject(:docking_station) {described_class.new}

	it { is_expected.to respond_to :release_bike }

	it "gets a bike and checks if it works" do
		bike = Bike.new
		subject.dock(bike)
    subject.release_bike
		expect(bike).to be_working
	end

	it { is_expected.to respond_to :bikes}

	it { is_expected.to respond_to(:dock).with(1).arguments }

	it "returns docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bikes).to eq [bike]
	end

	it "doesn't release bikes when there aren't any available" do
		expect{ subject.release_bike }.to raise_error "NO BIKES!"
	end

	it "return an error when docking stations are full" do
		subject.dock(Bike.new)
		expect { subject.dock Bike.new }.to raise_error "Docking Stations are full"
	end

	describe '#dock' do
		it "return an error when docking stations are 20" do
				subject.dock(Bike.new)
				expect {(20.times { subject.dock Bike.new })}.to raise_error "Docking stations are full"
			end
	end
end
