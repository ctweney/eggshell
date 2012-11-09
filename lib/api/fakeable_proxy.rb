module Api

  VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/fakeable_proxy_data'
    c.hook_into :fakeweb
    c.debug_logger = File.open(Rails.root.join("log", "vcr-debug.log"), 'w')
  end

  class FakeableProxy < Sinatra::Base

    def fake
      false
    end

    def make_request(request_id, force_fake = nil, &block)
      if fake || force_fake
        p "Fake mode on, using VCR to wrap request id #{request_id}"
        VCR.use_cassette(request_id, :allow_playback_repeats => true) do
          block.call
        end
      else
        block.call
      end
    end

  end
end