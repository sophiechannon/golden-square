require "reading_time"

RSpec.describe "Reading Time Method" do
  it "Estimates reading time of text under 200 words" do
    expect(estimate_reading_time("Lorem Ipsum")).to eq "About 1 minute"
  end   
  it "Estimates reading time of text over 200 words" do
    expect(estimate_reading_time("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a libero in augue condimentum faucibus. Nullam aliquam vitae sapien et aliquam. Pellentesque sodales sem a sagittis scelerisque. Sed erat mauris, elementum sit amet auctor ac, condimentum eu velit. Donec vel metus magna. Suspendisse feugiat nisi et nisi rutrum, vitae placerat purus sodales. Ut tortor eros, ultrices ut nunc eget, dictum pellentesque dolor. Aliquam sed hendrerit dolor. Praesent nec urna eget massa blandit congue eu vitae nunc. Praesent in nunc id augue rutrum feugiat. Mauris nec velit eros. Phasellus nec aliquet elit. Morbi egestas nisl a tellus vulputate, nec accumsan lacus pharetra. Mauris sollicitudin sit amet ex et elementum. Suspendisse potenti. Vestibulum at luctus diam. Proin lacinia nulla massa, vitae facilisis turpis dapibus in. In a sapien ut lorem fringilla ullamcorper quis id odio. Integer tincidunt ante a eros semper, vitae vehicula elit ultricies. Praesent tincidunt mi lacus, eget rutrum augue rhoncus nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vulputate felis justo, nec pretium nibh lobortis eu. Morbi tristique nisl non orci blandit tempus sed quis dolor. Fusce in luctus libero. Ut vestibulum odio elit, efficitur sollicitudin nunc pharetra ut. Aliquam eu dui eget metus.")).to eq "About 2 minutes"
  end   
  it "Throws error if string is empty" do
    expect { estimate_reading_time("") }.to raise_error "No text was provided"
  end
end