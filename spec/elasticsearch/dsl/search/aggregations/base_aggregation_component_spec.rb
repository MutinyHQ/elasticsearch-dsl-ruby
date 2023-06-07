# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'spec_helper'

describe Elasticsearch::DSL::Search::BaseAggregationComponent do

  include Elasticsearch::DSL

  describe '#aggregations' do

    let(:s) do
      search do
        aggregation :foo_nested do
          nested(path: :foo) do
            aggregation :bar_nested do
              nested(path: :bar) do
                aggregation :baz_nested do
                  nested(path: :baz)
                end
              end
            end
          end
        end
      end
    end

    it 'calls the block and returns the aggregations' do
      expect(s.aggregations).to_not be_nil
      expect(s.aggregations).to have_key(:foo_nested)
      expect(
        s.aggregations.
          fetch(:foo_nested).
          aggregations,
      ).to have_key(:bar_nested)
      expect(
        s.aggregations.
          fetch(:foo_nested).
          aggregations.
          fetch(:bar_nested).
          aggregations,
      ).to have_key(:baz_nested)
    end

  end
end

