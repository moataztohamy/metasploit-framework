RSpec.shared_context 'Msf::UIDriver' do
  let(:driver) do
    double(
      'Driver',
      :framework => framework
    ).tap { |driver|
      expect(driver).to receive(:on_command_proc=).with(kind_of(Proc))
      expect(driver).to receive(:print_line).with(kind_of(String)) do |string|
        @output ||= []
        @output.concat string.split("\n")
      end
      expect(driver).to receive(:print_status).with(kind_of(String)) do |string|
        @output ||= []
        @output.concat string.split("\n")
      end
      expect(driver).to receive(:print_error).with(kind_of(String)) do |string|
        @error ||= []
        @error.concat string.split("\n")
      end
    }
  end
end
