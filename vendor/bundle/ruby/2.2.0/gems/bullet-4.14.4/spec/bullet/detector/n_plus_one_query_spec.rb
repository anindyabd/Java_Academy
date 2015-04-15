require 'spec_helper'

module Bullet
  module Detector
    describe NPlusOneQuery do
      before(:all) do
        @post = Post.first
        @post2 = Post.last
      end

      context ".call_association" do
        it "should add call_object_associations" do
          expect(NPlusOneQuery).to receive(:add_call_object_associations).with(@post, :associations)
          NPlusOneQuery.call_association(@post, :associations)
        end
      end

      context ".possible?" do
        it "should be true if possible_objects contain" do
          NPlusOneQuery.add_possible_objects(@post)
          expect(NPlusOneQuery.send(:possible?, @post.bullet_key)).to eq true
        end
      end

      context ".impossible?" do
        it "should be true if impossible_objects contain" do
          NPlusOneQuery.add_impossible_object(@post)
          expect(NPlusOneQuery.send(:impossible?, @post.bullet_key)).to eq true
        end
      end

      context ".association?" do
        it "should be true if object, associations pair is already existed" do
          NPlusOneQuery.add_object_associations(@post, :association)
          expect(NPlusOneQuery.send(:association?, @post.bullet_key, :association)).to eq true
        end

        it "should be false if object, association pair is not existed" do
          NPlusOneQuery.add_object_associations(@post, :association1)
          expect(NPlusOneQuery.send(:association?, @post.bullet_key, :associatio2)).to eq false
        end
      end

      context ".conditions_met?" do
        it "should be true if object is possible, not impossible and object, associations pair is not already existed" do
          allow(NPlusOneQuery).to receive(:possible?).with(@post.bullet_key).and_return(true)
          allow(NPlusOneQuery).to receive(:impossible?).with(@post.bullet_key).and_return(false)
          allow(NPlusOneQuery).to receive(:association?).with(@post.bullet_key, :associations).and_return(false)
          expect(NPlusOneQuery.send(:conditions_met?, @post.bullet_key, :associations)).to eq true
        end

        it "should be false if object is not possible, not impossible and object, associations pair is not already existed" do
          allow(NPlusOneQuery).to receive(:possible?).with(@post.bullet_key).and_return(false)
          allow(NPlusOneQuery).to receive(:impossible?).with(@post.bullet_key).and_return(false)
          allow(NPlusOneQuery).to receive(:association?).with(@post.bullet_key, :associations).and_return(false)
          expect(NPlusOneQuery.send(:conditions_met?, @post.bullet_key, :associations)).to eq false
        end

        it "should be false if object is possible, but impossible and object, associations pair is not already existed" do
          allow(NPlusOneQuery).to receive(:possible?).with(@post.bullet_key).and_return(true)
          allow(NPlusOneQuery).to receive(:impossible?).with(@post.bullet_key).and_return(true)
          allow(NPlusOneQuery).to receive(:association?).with(@post.bullet_key, :associations).and_return(false)
          expect(NPlusOneQuery.send(:conditions_met?, @post.bullet_key, :associations)).to eq false
        end

        it "should be false if object is possible, not impossible and object, associations pair is already existed" do
          allow(NPlusOneQuery).to receive(:possible?).with(@post.bullet_key).and_return(true)
          allow(NPlusOneQuery).to receive(:impossible?).with(@post.bullet_key).and_return(false)
          allow(NPlusOneQuery).to receive(:association?).with(@post.bullet_key, :associations).and_return(true)
          expect(NPlusOneQuery.send(:conditions_met?, @post.bullet_key, :associations)).to eq false
        end
      end

      context ".call_association" do
        it "should create notification if conditions met" do
          expect(NPlusOneQuery).to receive(:conditions_met?).with(@post.bullet_key, :association).and_return(true)
          expect(NPlusOneQuery).to receive(:caller_in_project).and_return(["caller"])
          expect(NPlusOneQuery).to receive(:create_notification).with(["caller"], "Post", :association)
          NPlusOneQuery.call_association(@post, :association)
        end

        it "should not create notification if conditions not met" do
          expect(NPlusOneQuery).to receive(:conditions_met?).with(@post.bullet_key, :association).and_return(false)
          expect(NPlusOneQuery).not_to receive(:caller_in_project!)
          expect(NPlusOneQuery).not_to receive(:create_notification).with("Post", :association)
          NPlusOneQuery.call_association(@post, :association)
        end
      end

      context ".caller_in_project" do
        it "should include only paths that are in the project" do
          in_project = File.join(Dir.pwd, 'abc', 'abc.rb')
          not_in_project = '/def/def.rb'

          expect(NPlusOneQuery).to receive(:caller).and_return([in_project, not_in_project])
          expect(NPlusOneQuery).to receive(:conditions_met?).with(@post.bullet_key, :association).and_return(true)
          expect(NPlusOneQuery).to receive(:create_notification).with([in_project], "Post", :association)
          NPlusOneQuery.call_association(@post, :association)
        end

        context "stacktrace_includes" do
          before { Bullet.stacktrace_includes = [ 'def' ] }
          after { Bullet.stacktrace_includes = nil }

          it "should include paths that are in the stacktrace_include list" do
            in_project = File.join(Dir.pwd, 'abc', 'abc.rb')
            included_gem = '/def/def.rb'
            excluded_gem = '/ghi/ghi.rb'

            expect(NPlusOneQuery).to receive(:caller).and_return([in_project, included_gem, excluded_gem])
            expect(NPlusOneQuery).to receive(:conditions_met?).with(@post.bullet_key, :association).and_return(true)
            expect(NPlusOneQuery).to receive(:create_notification).with([in_project, included_gem], "Post", :association)
            NPlusOneQuery.call_association(@post, :association)
          end
        end
      end

      context ".add_possible_objects" do
        it "should add possible objects" do
          NPlusOneQuery.add_possible_objects([@post, @post2])
          expect(NPlusOneQuery.send(:possible_objects)).to be_include(@post.bullet_key)
          expect(NPlusOneQuery.send(:possible_objects)).to be_include(@post2.bullet_key)
        end

        it "should not raise error if object is nil" do
          expect { NPlusOneQuery.add_possible_objects(nil) }.not_to raise_error
        end
      end

      context ".add_impossible_object" do
        it "should add impossible object" do
          NPlusOneQuery.add_impossible_object(@post)
          expect(NPlusOneQuery.send(:impossible_objects)).to be_include(@post.bullet_key)
        end
      end
    end
  end
end
