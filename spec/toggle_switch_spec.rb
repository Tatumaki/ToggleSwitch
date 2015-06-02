require 'spec_helper'

describe ToggleSwitch do
  it 'has a version number' do
    expect(ToggleSwitch::VERSION).not_to be nil
  end

  context 'should be set with each scope' do
    before do
      ToggleSwitch.load({
        a: true,
        b: false,
        c: nil,
        e: {
          e_a: true,
          e_b: false,
          e_c: nil
        }
      })
    end

    it 'should be set true in [:a] scope' do
      expect(ToggleSwitch.class_variable_get(:@@config)[:a]).to eq(true)
    end

    it 'should be set false in [:b] scope' do
      expect(ToggleSwitch.class_variable_get(:@@config)[:b]).to eq(false)
    end

    it 'should not be set in [:d] scope' do
      expect(ToggleSwitch.class_variable_get(:@@config)[:d]).to eq(nil)
    end
  end

  context 'block runs if set' do 
    before do
      ToggleSwitch.load({
        a: true,
        b: false,
        c: nil,
        e: {
          e_a: true,
          e_b: false,
          e_c: nil
        }
      })
    end

    it 'should be run in [:a] scope' do
      passed = false
      ToggleSwitch[:a].run do
        passed = true
      end
      expect(passed).to eq(true)
    end

    it 'should be run in [:e][:e_a] scope' do
      passed = false
      ToggleSwitch[:e][:e_a].run do
        passed = true
      end
      expect(passed).to eq(true)
    end

    it 'should not be run in [:d] scope' do
      passed = false
      ToggleSwitch[:d].run do
        passed = true
      end
      expect(passed).to eq(false)
    end

    it 'should not be run in [:e][:e_d] scope' do
      passed = false
      ToggleSwitch[:e][:e_d].run do
        passed = true
      end
      expect(passed).to eq(false)
    end

  end
end
